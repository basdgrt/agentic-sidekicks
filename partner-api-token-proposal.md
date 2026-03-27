# Partner API Token Differentiation Proposal

## Background

The Partner API controls access to its endpoints using token-based authorization. The current model is identity-based: tokens carry one or more identities (e.g. `retailer`), and the Partner API infers which scopes are present from those identities. If a token contains a `retailer` identity, the Partner API treats the `retailer` scope as granted.

The `scopes` field exists in the token but is not used by the Partner API today. Our team controls the auth server and issues all tokens.

## Target Architecture

The target architecture moves the Partner API away from identity-based access toward fine-grained scope-based access. Rather than inferring permissions from identity, the Partner API will use the `scopes` field in the token directly. Scopes are explicit and granular — e.g. `sellers.read` or `orders.write` — leaving no ambiguity about what a token is authorized to do.

New tokens carry both identities and fine-grained scopes. These tokens are already being issued, or will be very soon.

## The Problem

During migration, the Partner API must support both old (identity-based) and new (scope-based) tokens simultaneously. Old tokens will eventually be phased out, but the timeline is long — dual support is needed for the foreseeable future.

To apply the right logic, the Partner API must identify the token type on each request. No reliable way to make that distinction exists. Both old and new tokens contain identities and a `scopes` field — the structure alone does not signal token type. This forces the Partner API to guess which check to run, risking either incorrectly denying legitimate access or granting more access than intended.

## Why the Current Workaround Falls Short

The current workaround checks whether any scope in the token contains a dot (e.g. `sellers.read`). If one is found, the token is treated as fine-grained and scope-based authorization is applied. Otherwise, identity-based logic is used.

This approach is fragile. Scope naming is not enforced — anyone can issue a scope with a dot in the name, regardless of whether the token is old or new. This means:

- An old token that happens to contain a dotted scope will be misidentified as fine-grained, and identity-based authorization will be skipped.
- A new fine-grained token with no dotted scopes will be treated as old, and identity-based logic will be applied instead.

Beyond the failure modes, basing authorization decisions on text formatting is not a sound practice. The dot convention creates an implicit contract that is invisible, undocumented, and easy to break — accidentally, or through a future scope naming change.

## Solution Criteria

Any solution to this problem should satisfy the following:

- **Unambiguous signal**: the token must carry a reliable, explicit indicator of whether it is old or new — not something inferred from content patterns.
- **Header compatible**: the solution must fit within what can be passed in a request header, without requiring changes to how the Partner API receives tokens.
- **Backward compatible**: existing old tokens must continue to work without modification.
- **Explicit contract**: the distinction between old and new tokens should be visible, documentable, and not dependent on naming conventions or implicit assumptions.
