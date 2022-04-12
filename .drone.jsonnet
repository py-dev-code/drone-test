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
      "mkdir temp_stg ; cd temp_stg",
      "echo hello > test1.txt",
      " [ -s test1.txt ] && echo file is not empty && cat test1.txt"
      // "echo $code1 ; echo $code2"
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
