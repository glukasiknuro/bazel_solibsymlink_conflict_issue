load("@io_bazel_rules_docker//python:image.bzl", "py_image")

py_image(
    name = "test_py_image",
    srcs = ["main.py"],
    main = "main.py",
    base = "@busybox//image",
)
