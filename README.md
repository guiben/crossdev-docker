# Gentoo's crossdev in a docker container

## Structure

```
.
├── conf                              # Configuration used for crossdev
│  ├── etc
│  │  └── portage
│  │     └── repos.conf
│  │        └── crossdev.conf
│  └── var
│     └── db
│        └── repos
│           └── localrepo-crossdev
│              ├── metadata
│              │  └── layout.conf
│              └── profiles
│                 └── repo_name
├── Dockerfile                        # Generic crossdev container
├── generate_crossdev.sh              # Script to generate a docker container for a specific architecture
├── LICENSE                           # LICENSE
└── README.md                         # README
```

## Usage

```
$ ./generate_crossdev.sh <architecture>
```

This command will create a container based on the generic `crossdev` container.

The generic `crossdev` container is created as `crossdev-docker_generic`.

The specific container for a given architecture will be called `crossdev-docker_${architecture}`.
