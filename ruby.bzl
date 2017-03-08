def impl(ctx):
    ctx.action(
        inputs = [ctx.file.src],
        command = "%s %s; echo 'Ruby is compiled!' > %s" % (ctx.file._ruby.path, ctx.file.src.path, ctx.outputs.txt.path),
        outputs = [ctx.outputs.txt]
    )

ruby_binary = rule(
    attrs = {
        'src' : attr.label(
            allow_files = True,
            single_file = True),
        '_ruby' : attr.label(
            default=Label("@ruby//:bin/irb"),
            allow_files = True,
            single_file = True),
    },
    outputs = {'txt': "%{name}.txt"},
    implementation = impl
)
