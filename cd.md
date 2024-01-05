CD can refer to one of two things:

## Continuous Deployment

An software development practice of creating software in short cycles, with code being automatically built, tested and staged for release. This can happen at any time.

[Click here for a description of the process](https://en.wikipedia.org/wiki/Continuous_delivery?useskin=vector#/media/File:Continuous_Delivery_process_diagram.svg)

### Tools
- CircleCI
- Jenkins
- Gitlab
- Bamboo
- AWS CodePipeline

Choosing the appropriate tool depends on considerations like tech stack used, level of scalability required and of course, the various features that each tool provides.

**NOTE: CircleCI had a serious data breach in 2019. Secret rotation is advised with this or in fact any other tool** 

## Continuous Delivery

Takes continuous deployment one step further, by automating every change and step of the deployment pipeline. Overlaps more completely with Kubernetes.

### Tools
- Argo CD
- Flux CD
- Spinnaker
- Ketpn (for cloud-native applications)


|                    | Continuous Delivery  |                    | Continuous Deployment |                             |
|--------------------|----------------------|--------------------|-----------------------|-----------------------------|
| **Pros**           | **Cons**             | **Pros**           | **Cons**              |                             |
| Controlled releases| Potential delays     | Speed and efficiency| Risk of bugs          |                             |
| Risk mitigation    | Human error          | Reduced manual work | Requires robust testing|                             |
| Flexibility        | Less frequent releases| Rapid feedback loop| Rapid changes may confuse users |


---

**Which strategy is more appropriate for our project?**

