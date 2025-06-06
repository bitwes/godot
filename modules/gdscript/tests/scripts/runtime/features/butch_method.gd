extends Node

var expected_script_path = "res://runtime/features/butch_method.notest.gd"
var _is_doing_output = false

func _init():
    _is_doing_output = OS.get_cmdline_args().has("--gdscript-generate-tests")


# This ensures that the generated .out file contains expected strings and
# not the output of the method.
func _print(got, expected):
    if(_is_doing_output):
        print(expected)
    else:
        print(got)


func test():
    _print(
        butch_method(ButchMethodNoTestScript.InnerClass1.new()),
        "InnerClass1")
    _print(
        butch_method(ButchMethodNoTestScript.InnerClass1.InnerClass1_A.new()),
        "InnerClass1/InnerClass1_A")