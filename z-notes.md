# Site ideas
Rather than what the guide recommends for HTML, CSS, and Javascript... We should consider Jekyll.
Should consider looking at Hugo as well.

It will look prettier and will be easier to define.

# Issues and considerations

- Might hardcode values then refactor.
- Domain is used for other things... might want to use external dns provider. This will add complexity if all configurations are deployed via Terraform. Sticking to manual assignment of CloudFront CNAME, ACM Certificates, and DNS Records. We might be able to automate some of this but I don't want 
- 

- /env/ folder with dev and prod .tfvars and .tfbackend (probably won't implement until after everything works)

- REL to S3 https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html

- Debating on fixing hardcoded values... python and javascript will have these.
- Hardcoded javascript less of an issue, we can have website content separate anyways.
- Could change API Gateway to only allow invocation with specified domain.
- add proper logging and error handling to lambda