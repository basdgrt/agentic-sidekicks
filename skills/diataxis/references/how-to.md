# How-to Guide Documentation

## Purpose

How-to guides are **goal-oriented** directions that show how to solve a specific problem or accomplish a particular task. They are recipes for getting things done.

## Key Characteristics

- **Goal-oriented**: Focused on achieving a specific outcome
- **Practical**: Provides actionable steps to solve real problems
- **Flexible**: Assumes some experience and allows for variation
- **Direct**: Gets straight to the solution without unnecessary context
- **Narrow scope**: Addresses one specific task or problem

## The How-to Guide's Promise

"Here's how to [accomplish specific task/solve specific problem]."

## Structure

### 1. Title
- Use action-oriented language: "How to...", "Configure...", "Deploy..."
- Be specific about the outcome

### 2. Brief Introduction (optional)
- State the problem or goal (1-2 sentences)
- Mention prerequisites if necessary
- Link to related guides or background information

### 3. Steps
- List concrete actions in order
- Focus on what to do, not why
- Include necessary code, commands, or configurations
- Note important warnings or gotchas

### 4. Verification (optional)
- How to confirm the task was completed successfully
- Expected results or outputs

## Writing Guidelines

### Do:
- **Start with the goal**: Make the purpose clear immediately
- **Assume competence**: The reader knows the basics and wants solutions
- **Be concise**: Get to the point quickly
- **Provide working examples**: Use realistic, tested code/commands
- **Allow flexibility**: Acknowledge variations ("If you're using X, then...")
- **Focus on the task**: Stay narrowly focused on accomplishing the goal
- **Use imperative mood**: "Configure the setting", "Run this command"

### Don't:
- **Teach from scratch**: Assume basic familiarity with the domain
- **Explain underlying concepts**: Link to explanation docs if needed
- **Provide unnecessary context**: Focus on the task at hand
- **Make it a tutorial**: Don't hold the reader's hand through every detail
- **Document all options**: Show what's needed for this specific task
- **Repeat reference material**: Link to reference docs for complete API details

## Tone and Voice

- **Direct and efficient**: "To configure X, edit the config file"
- **Problem-solving focus**: "If you encounter X, do Y"
- **Practical and action-oriented**: "Run this command to..."
- **Confident**: "This will..." not "This should..."

## Example Structure

```markdown
# How to Deploy Your Application to Production

This guide shows you how to deploy your application to a production environment using Docker and Kubernetes.

**Prerequisites**: Docker installed, Kubernetes cluster configured, application containerized

## 1. Build the production image

Build your Docker image with the production tag:

```bash
docker build -t myapp:prod .
```

## 2. Push to registry

Push the image to your container registry:

```bash
docker push myapp:prod
```

## 3. Update Kubernetes deployment

Edit your deployment manifest to use the new image:

```yaml
spec:
  containers:
  - name: myapp
    image: myapp:prod
```

Apply the updated deployment:

```bash
kubectl apply -f deployment.yaml
```

## 4. Verify the deployment

Check that pods are running:

```bash
kubectl get pods
```

You should see your pods in the `Running` state.

## Troubleshooting

**Pods not starting**: Check logs with `kubectl logs <pod-name>`
**Image pull errors**: Verify registry authentication with `kubectl describe pod <pod-name>`
```

## Common Patterns

### Multiple Approaches

When there are different ways to accomplish the same goal:

```markdown
# How to Install the CLI

## Using package manager (recommended)

For most users, installing via package manager is simplest:

```bash
apt install myapp
```

## From source

If you need the latest development version:

```bash
git clone https://github.com/org/myapp
cd myapp
make install
```
```

### Conditional Steps

When steps vary based on environment:

```markdown
## Configure authentication

**For AWS**:
```bash
export AWS_ACCESS_KEY=your-key
```

**For GCP**:
```bash
gcloud auth login
```
```

### Warning Callouts

Highlight important warnings:

```markdown
## Delete old data

⚠️ **Warning**: This action is irreversible. Make sure you have backups.

```bash
rm -rf /data/old
```
```

## Common Pitfalls to Avoid

1. **Too much explanation**: How-to guides solve problems, they don't teach. Keep explanations minimal.
2. **Too much hand-holding**: Assume the reader has basic competence. Don't explain every detail.
3. **Broad scope**: Each guide should address one specific task, not multiple related tasks.
4. **Missing prerequisites**: State what the reader needs to know or have before starting.
5. **Untested examples**: Every code snippet and command must be tested and working.
6. **Vague instructions**: "Configure the settings appropriately" is not helpful. Be specific.
7. **Missing error handling**: Address common failure modes and how to resolve them.

## When to Use How-to Guides

Use how-to guides when:
- Users need to accomplish a specific task
- Solving a common problem or use case
- Configuring or setting up specific features
- Integrating with external systems
- Performing administrative or maintenance tasks

Don't use how-to guides for:
- Teaching beginners the basics (use tutorials)
- Explaining concepts or theory (use explanation)
- Documenting all available options (use reference)

## How-to vs Tutorial

| How-to Guide | Tutorial |
|--------------|----------|
| Assumes experience | Assumes beginner |
| Solves specific problem | Teaches through project |
| Direct and concise | Detailed and complete |
| Allows flexibility | One clear path |
| Goal-oriented | Learning-oriented |
| "Here's how to do X" | "Let's learn by doing X" |
