var exec = require('child_process').exec;

exports.handler = function(event, context) {
    process.env.LD_LIBRARY_PATH = process.env.LAMBDA_TASK_ROOT;
    child = exec("./prog.bin", function(error) {
	context.done(error, 'Process complete!');
    });
    child.stdout.on('data', console.log);
    child.stderr.on('data', console.error);
    child.stdin.write(JSON.stringify(event));
    child.stdin.end();
};
