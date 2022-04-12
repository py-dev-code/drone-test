local test_step() = {
    "name": "test_step",
    "image": "ubuntu",
    "volumes": [
      {
        "name": "docker_socket",
        "path": "/var/run/docker.sock"
      }
    ],
    "commands": [
      "echo hello-world",
      "cd temp_stg"
    ]
};

[
{
  "kind": "pipeline",
  "type": "docker",
  "name": "test_pipeline",
  "clone": {
    "disable": true
  },
  "trigger": {
    "event": [
      "push"
    ],
    "branch": [
      "main"
    ],
  },
  "volumes": [
    {
      "name": "docker_socket",
      "host": {
        "path": "/var/run/docker.sock"
      }
    }
  ],
  "steps": [
    test_step()
  ]
}

// {
//   "kind": "pipeline",
//   "type": "exec",
//   "name": "test_pipeline",
//   "trigger": {
//     "event": [
//       "push"
//     ],
//     "branch": [
//       "main"
//     ],
//   },
//   "platform": {
//     "os": "linux",
//     "arch": "amd64"
//   },
//   "steps": [
//     test_step()
//   ]
// }
]
