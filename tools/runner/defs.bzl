load("@aspect_rules_py//py:defs.bzl", "py_test")
load("@third_party_deps//:requirements.bzl", "requirement")

"""Wrap pytest"""
def pytest_runner(name, srcs, deps = [], args = [], data = [], **kwargs):
    """
        Call pytest
    """
    py_test(
        name = name,
        srcs = ["//tools/runner:pytest_wrapper.py"] + srcs,
        main = "//tools/runner:pytest_wrapper.py",
        args = [
            "--capture=no"
        ] + args + ["$(location :%s)" % x for x in srcs],
        deps = deps + [
            requirement("pytest")
        ],
        data = [] + data,
        **kwargs
    )


