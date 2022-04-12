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
      "code1=`echo file#1 > file1.txt`",
      // "code2=`echo file#2 > ./temp_stg/file2.txt`",
      "echo $code1"
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
