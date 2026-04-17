# Technical Reference Documentation

## Purpose

Reference documentation is **information-oriented** material that describes the machinery and how to operate it. It provides complete, accurate, and findable information about the system's components.

## Key Characteristics

- **Information-oriented**: Focused on describing what something is and what it does
- **Comprehensive**: Covers all features, parameters, options, and behaviors
- **Accurate**: Technically precise and up-to-date
- **Consistent**: Follows predictable structure and formatting
- **Findable**: Well-organized for lookup and scanning
- **Austere**: Descriptive rather than conversational

## The Reference's Promise

"Here is complete and accurate information about [component/feature]."

## Structure

Reference documentation structure varies by type, but common patterns include:

### API Reference Structure
1. **Overview**: Brief description of the API/endpoint
2. **Endpoint/Method signature**: Exact syntax
3. **Parameters**: Complete list with types, defaults, constraints
4. **Return values**: What the API returns, types, possible values
5. **Errors**: Possible error codes and conditions
6. **Examples**: Minimal working examples

### CLI Reference Structure
1. **Command name**: The command and its purpose
2. **Synopsis**: Usage syntax with options
3. **Description**: What the command does
4. **Options**: All flags and arguments with descriptions
5. **Examples**: Common usage patterns
6. **Exit codes**: Possible return codes

### Configuration Reference Structure
1. **Setting name**: The configuration key/option
2. **Type**: Data type and valid values
3. **Default**: Default value if not set
4. **Description**: What the setting controls
5. **Examples**: Example configurations

## Writing Guidelines

### Do:
- **Be exhaustive**: Document every parameter, option, and behavior
- **Be precise**: Use exact terminology and technical accuracy
- **Follow consistent structure**: Every entry should follow the same pattern
- **State facts**: Describe what it is and does
- **Include types and constraints**: Data types, valid ranges, allowed values
- **Show examples**: Provide minimal, clear examples of usage
- **Keep it current**: Reference docs must match the actual implementation
- **Make it scannable**: Use tables, lists, and clear headings

### Don't:
- **Explain concepts**: Save explanations for explanation docs
- **Provide tutorials**: Reference is for lookup, not learning
- **Include opinions**: "We recommend..." belongs elsewhere
- **Be conversational**: Maintain neutral, technical tone
- **Assume context**: Each entry should be self-contained
- **Hide important details**: Document edge cases and special behaviors

## Tone and Voice

- **Neutral and factual**: "Returns an integer representing..."
- **Present tense**: "The function accepts...", "The parameter controls..."
- **Third person**: Describe what it does, not what the user should do
- **Technical and precise**: Use proper terminology
- **Concise but complete**: Every word earns its place

## Example Structures

### Function/Method Reference

```markdown
## `getUserById()`

Retrieves a user record by their unique identifier.

### Signature

```typescript
getUserById(id: string, options?: FetchOptions): Promise<User>
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | Yes | The unique user identifier (UUID format) |
| `options` | FetchOptions | No | Additional fetch options |
| `options.includeDeleted` | boolean | No | Include soft-deleted users (default: `false`) |
| `options.fields` | string[] | No | Specific fields to return (default: all fields) |

### Returns

`Promise<User>` - A promise that resolves to a User object.

### Errors

| Error | Condition |
|-------|-----------|
| `UserNotFoundError` | No user exists with the given ID |
| `ValidationError` | Invalid ID format (not a valid UUID) |
| `DatabaseError` | Database connection failed |

### Example

```typescript
const user = await getUserById('550e8400-e29b-41d4-a716-446655440000');
console.log(user.name);

// With options
const user = await getUserById('550e8400-e29b-41d4-a716-446655440000', {
  includeDeleted: true,
  fields: ['id', 'name', 'email']
});
```
```

### CLI Command Reference

```markdown
## `deploy`

Deploy an application to the specified environment.

### Synopsis

```bash
myapp deploy [OPTIONS] <environment>
```

### Arguments

| Argument | Description |
|----------|-------------|
| `<environment>` | Target environment (staging, production) |

### Options

| Option | Short | Type | Default | Description |
|--------|-------|------|---------|-------------|
| `--region` | `-r` | string | us-east-1 | AWS region for deployment |
| `--tag` | `-t` | string | latest | Docker image tag to deploy |
| `--rollback` | | boolean | false | Rollback to previous version on failure |
| `--dry-run` | | boolean | false | Simulate deployment without making changes |
| `--verbose` | `-v` | boolean | false | Enable verbose logging |

### Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Deployment successful |
| 1 | Deployment failed |
| 2 | Invalid arguments |

### Examples

```bash
# Deploy to staging
myapp deploy staging

# Deploy specific tag to production with rollback
myapp deploy production --tag v1.2.3 --rollback

# Simulate deployment
myapp deploy staging --dry-run
```
```

### Configuration Reference

```markdown
## Database Configuration

### `database.host`

**Type**: `string`  
**Required**: Yes  
**Default**: None

The hostname or IP address of the database server.

**Example**:
```yaml
database:
  host: "db.example.com"
```

### `database.port`

**Type**: `integer`  
**Required**: No  
**Default**: `5432`  
**Valid range**: 1-65535

The port number for database connections.

**Example**:
```yaml
database:
  port: 5433
```

### `database.pool`

**Type**: `object`  
**Required**: No

Connection pool configuration.

#### `database.pool.min`

**Type**: `integer`  
**Default**: `2`  
**Valid range**: 0-100

Minimum number of connections to maintain in the pool.

#### `database.pool.max`

**Type**: `integer`  
**Default**: `10`  
**Valid range**: 1-100

Maximum number of connections allowed in the pool.

**Example**:
```yaml
database:
  pool:
    min: 5
    max: 20
```
```

## Organization Strategies

### Alphabetical
Organize entries alphabetically for easy lookup:
- Good for: Large APIs, configuration options
- Example: Python's standard library reference

### Hierarchical
Group related items into categories:
- Good for: Complex systems with clear subsystems
- Example: AWS documentation (EC2, S3, Lambda)

### By Type
Organize by kind of component:
- Good for: Diverse APIs (classes, functions, constants)
- Example: JavaScript libraries (Classes, Methods, Types)

### By Workflow
Order by typical usage sequence:
- Good for: Linear workflows, build steps
- Example: Build tool commands (configure, build, test, deploy)

## Common Pitfalls to Avoid

1. **Incomplete coverage**: Missing parameters or options confuses users
2. **Outdated information**: Reference must match current implementation exactly
3. **Inconsistent structure**: Different entries using different formats
4. **Too much explanation**: Reference describes, it doesn't teach or explain why
5. **Vague descriptions**: "Controls the behavior" doesn't help; be specific
6. **Missing examples**: Even reference docs benefit from minimal examples
7. **Poor organization**: Users can't find what they need
8. **Missing types**: Not specifying data types or valid values
9. **Undefined terms**: Using jargon without definition or links

## When to Use Reference Documentation

Use reference documentation when:
- Documenting APIs, functions, classes, methods
- Describing CLI commands and options
- Listing configuration settings and parameters
- Cataloging features and capabilities
- Providing technical specifications

Don't use reference documentation for:
- Teaching beginners (use tutorials)
- Solving specific problems (use how-to guides)
- Explaining concepts or architecture (use explanation)

## Reference vs Other Types

| Reference | Tutorial | How-to | Explanation |
|-----------|----------|--------|-------------|
| Information-oriented | Learning-oriented | Goal-oriented | Understanding-oriented |
| Describes components | Teaches by doing | Solves problems | Clarifies concepts |
| Complete coverage | Focused project | Specific task | Background knowledge |
| Factual | Encouraging | Direct | Thoughtful |
| Lookup tool | Learning path | Recipe | Context |
