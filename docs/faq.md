# FAQ

**Does Launchrail run in Launchrail's AWS account?**
No. Launchrail runs in the customer's AWS account.

**How do deployments happen?**
By PRs updating environment values. Argo CD syncs from Git.

**Can we use our existing CI?**
Yes. Launchrail defines the contract; CI can be GitHub Actions, CodeBuild, etc.

**Is multi-region required?**
Not for MVP. Launchrail supports scaling to multi-region as you mature.
