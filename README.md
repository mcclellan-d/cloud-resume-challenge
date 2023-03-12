# Logical Map
![](logical_map_2.png)
# Challenge

The proposed challenge:
https://cloudresumechallenge.dev/docs/the-challenge/aws/

The *Cloud Resume Challenge* objectives can be summarized as the following components. Everything is deployed using serverless infrastructure in AWS. Rather than manually creating everything, I've decided to use Terraform, which is Infrastructure as Code(IaC). I chose Python for the API as it's the language I'm comfortable with. Since my domain is already in Cloudflare, I chose to use that over Route53. CI/CD is implemented using GitHub actions, rather than using API Keys, I setup OpenID Connect(OIDC).

**Frontend**
- HTML + CSS (I've opted for a static site generator)
- Javascript (Used to interact with API gateway)
- CI/CD (Github Actions)

**Backend**
- Database (DynamoDB)
- API (Lambda + API Gateway)
- Python (Used in Lambda)
- DNS (Cloudflare)
- Infrastructure as Code (IaC)
- Source Control (Github)
- CI/CD (Github Actions)


Frontend Repo: https://github.com/mcclellan-d/cloud-resume-frontend

To do list
- [x] DNS w/ Cloudflare
- [x] ACM Certificates
- [x] CloudFront Distribution
- [x] S3 Bucket Configurations
- [x] API Gateway
- [x] Lambda (Python)
- [x] DynamoDB
- [x] Swap to static site generator
- [X] S3 Terraform State backend
- [X] Separate frontend from backend repo
- [X] OpenID Connect (OIDC)
- [X] CI/CD (Github Actions) Frontend
- [X] CI/CD (Github Actions) Backend
- Project Completed
- [ ] Blog post

Future Improvements
- [X] Implement GitHub as OIDC provider for assuming role
- [ ] Find more reliable Hugo Theme

Notes:
- I've decided to use Hugo rather than write my whole website in html and css.\
- Currently testing out [hugo-resume theme](https://themes.gohugo.io/themes/hugo-resume/), this still needs a few tweaks but it's good enough for now.

