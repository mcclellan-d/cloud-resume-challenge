# Challenge

The proposed challenge:
https://cloudresumechallenge.dev/docs/the-challenge/aws/

The have a guide specifically for [Terraform](https://cloudresumechallenge.dev/docs/extensions/terraform-getting-started/).

#
Site ideas
Rather than what the guide recommends for HTML, CSS, and Javascript... We should consider Jekyll.

It will look prettier and will be easier to define.


# CloudFront
Since we'll likely use cloudfront... we probably don't need to give direct access to our bucket.
Check cantrill course covering the section... 90% certain there's a lab associated

- Update: Yes, we can use ACM and CloudFront without route53

# Issues and considerations

- Might hardcode values then refactor.
- Domain is used for other things... might want to use external dns provider. This will add complexity if all configurations are deployed via Terraform. Sticking to manual assignment of CloudFront CNAME, ACM Certificates, and DNS Records. We might be able to automate some of this but I don't want 
- 

- /env/ folder with dev and prod .tfvars and .tfbackend (probably won't implement until after everything works)

- REL to S3 https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html




# OAC bucket policy works...
- Need to figure out how to properly add the policy or if this is generated somehow.