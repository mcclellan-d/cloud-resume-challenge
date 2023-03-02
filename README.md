# Work In Progress!

# Challenge

The proposed challenge:
https://cloudresumechallenge.dev/docs/the-challenge/aws/

I've decided to use Hugo rather than write my whole website in html and css.
Currently trying out a few themes, this will like change in the near future.

They have a guide specifically for [Terraform](https://cloudresumechallenge.dev/docs/extensions/terraform-getting-started/).

Current website link is https://test.0x00.link

I'm in the process of transferring 'mcclellan.cloud' domain to Cloudflare.

To do list
- [x] DNS w/ Cloudflare
- [x] ACM Certificates
- [x] CloudFront Distribution
- [x] S3 Bucket Configurations
- [x] API Gateway
- [x] Lambda (Python)
- [x] DynamoDB
- [x] Swap to static site generator
- [ ] S3 Terraform State backend
- [ ] CI/CD (Github Actions)
- [ ] Blog post

Optional Post objectives
- [ ] Separate frontend from backend repo
- [ ] Find more reliable Hugo Theme


Might not include Route53 as the domain is managed on cloudflare.

Tasks were split into separate modules by service... Some of these should have been consolidated. 

The end state should look similar to this.
# Logical Map
![](logical_map_2.png)