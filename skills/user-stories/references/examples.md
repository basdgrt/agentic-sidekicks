# User Story Examples

## Example 1: Clear input

Input:
"We need to move the captcha key from the Foo service to the Bar service. Foo is being deprecated and Bar is taking over captcha validation. The key is currently hardcoded in Foo's config."

Output:
```
Title: Migrate captcha key from Foo to Bar

Description:
The Foo service is being deprecated, and Bar is taking over captcha validation. The captcha key is currently hardcoded in Foo's configuration and needs to move to Bar before Foo is decommissioned. This migration ensures captcha validation continues to work without interruption during the Foo deprecation.

Acceptance criteria:
- Captcha key is configured in Bar
- Captcha validation works through Bar in all environments
- Captcha key is removed from Foo's configuration
- Follow-up story has been created to decommission Foo's captcha endpoint
```

## Example 2: Input requiring clarification

Input:
"We should probably do something about 2FA recovery"

This input is too vague. Ask clarifying questions:
- What specific problem are users experiencing with 2FA recovery?
- Is this about designing a recovery flow, fixing an existing one, or something else?
- What recovery methods should be supported (backup codes, email, SMS)?

## Example 3: Design context with specific scope

Input:
"Here's our 2FA design doc [large document]. I need a story for the part where we verify the user's email before enabling 2FA."

Output:
```
Title: Verify email address before enabling 2FA in webshop

Description:
The current 2FA setup flow allows users to enable two-factor authentication without a verified email address. This creates a risk where users lock themselves out with no recovery path. Adding email verification as a prerequisite step ensures every user with 2FA enabled has at least one verified recovery channel.

Acceptance criteria:
- Unverified users see a prompt to verify their email when attempting to enable 2FA
- 2FA setup is blocked until email verification is complete
- Users with already-verified email addresses skip the verification step
- Verification email follows existing email template standards
```

## Example 4: Technical migration

Input:
"Our feature flags are currently stored in a JSON file that gets deployed with the app. We want to move them to LaunchDarkly so product can toggle flags without a deploy. Start with the checkout flow flags."

Output:
```
Title: Migrate checkout flow feature flags to LaunchDarkly

Description:
Feature flags for the checkout flow are currently stored in a static JSON file bundled with the application, requiring a full deploy to toggle any flag. Moving these flags to LaunchDarkly gives the product team the ability to toggle flags independently without engineering involvement or deploy cycles. The checkout flow is the first area to migrate as a pilot before rolling out to the rest of the application.

Acceptance criteria:
- All checkout flow feature flags are configured in LaunchDarkly
- Application reads checkout flow flags from LaunchDarkly instead of the JSON file
- Checkout flow flags are removed from the static JSON file
- Flag evaluation works correctly in all environments (dev, staging, production)
- Rollback plan is documented in case of LaunchDarkly outage
```
