# Doppler

[Installing doppler CLI](https://docs.doppler.com/docs/install-cli)

## Further step

```
doppler login
# then follow instructions in the terminal
```

```
doppler setup
# use the provided yaml file
```

## Script

If the _secretsToDoppler_ binary is copied in the root folder of the Terraform file, it can be used similar to a bash script to inject the secrets into Doppler.

Note: for the time being it uses my former DynamoDB setup


## Uses and integrations

Doppler integrates with pretty much anything we want, including AWS Secrets and CircleCI. It's up to us to decide how we are going to use it.
As far as I'm concerned, I would prefer as much a DIY approach as possible, with minimum integrations.


## Drawbacks

As far as I've seen, we need to be on a paid plan to use it as a team. But I don't see any reason why we shouldn't use it independently, as we don't really have a common workspace and we'll just be sharing our individual workspaces.