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
      "apt-get update",
      "apt-get -y install jq curl"
      // "echo hello-world123 > temp.txt ; curl -u username:password --upload-file temp.txt http://drone-test.glid.to:8081/repository/glide-artifacts/test-results-101/temp3.txt"
    ]
};

[
{
  "kind": "pipeline",
  "type": "docker",
  "name": "test_pipeline",
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
