## To reproduce the issue:

```
wget https://github.com/bazelbuild/bazel/releases/download/5.0.0/bazel-5.0.0-linux-x86_64
chmod +x bazel-5.0.0-linux-x86_64
./bazel-5.0.0-linux-x86_64 build //:test_py_image

Starting local Bazel server and connecting to it...
ERROR: file '_solib__toolchain_Ck8_Ucc_Utoolchain/foo.so' is generated by these conflicting actions:
Label: //toolchain:k8_cc_toolchain
RuleClass: cc_toolchain rule
Configuration: 30ef7fa7561d68e72a06426dbdb1ff29fe154ce431958a511b45458ec146af56
Mnemonic: SolibSymlink
Action key: fb9103b4f577c25c225b84492070aef8fb18733871a75006b27c69ee7311572c, 1fb5751a4d74877adaf30c2a75ff8ae43324906fb1e7f94f6bf94b426e3566d6
Progress message: (null)
PrimaryInput: File:[/(...)/bazel_solibsymlink_conflict_issue[source]]toolchain/libs/foo.so
PrimaryOutput: File:[[<execution_root>]bazel-out/k8-py2-opt-ST-4a519fd6d3e4/bin]_solib__toolchain_Ck8_Ucc_Utoolchain/foo.so
Owner information: ToolchainDependencyConfiguredTargetKey{label=//toolchain:k8_cc_toolchain, config=BuildConfigurationValue.Key[30ef7fa7561d68e72a06426dbdb1ff29fe154ce431958a511b45458ec146af56], executionPlatformLabel=@io_bazel_rules_docker//platforms:local_container_platform}, ConfiguredTargetKey{label=//toolchain:k8_cc_toolchain, config=BuildConfigurationValue.Key[30ef7fa7561d68e72a06426dbdb1ff29fe154ce431958a511b45458ec146af56]}
MandatoryInputs: are equal
Outputs: are equal
ERROR: com.google.devtools.build.lib.skyframe.ArtifactConflictFinder$ConflictException: com.google.devtools.build.lib.actions.MutableActionGraph$ActionConflictException: for _solib__toolchain_Ck8_Ucc_Utoolchain/foo.so, previous action: action 'SolibSymlink _solib__toolchain_Ck8_Ucc_Utoolchain/foo.so', attempted action: action 'SolibSymlink _solib__toolchain_Ck8_Ucc_Utoolchain/foo.so'
```

## It works for bazel 4.2.2
```
wget https://github.com/bazelbuild/bazel/releases/download/4.2.2/bazel-4.2.2-linux-x86_64
chmod +x bazel-4.2.2-linux-x86_64
./bazel-4.2.2-linux-x86_64 build //:test_py_image

...

Target //:test_py_image up-to-date:
  bazel-out/k8-opt-ST-6390b2712f3f/bin/test_py_image-layer.tar
```
