// Require
var watchr = require('watchr')
var exec = require('child_process').exec,
    child;

// Watch a directory or file
console.log('Watch our paths');
watchr.watch({
    paths: ['.'],
    listeners: {
        log: function(logLevel) {
            console.log('a log message occured:', arguments);
        },
        error: function(err) {
            console.log('an error occured:', err);
        },
        watching: function(err, watcherInstance, isWatching) {
            console.log('a new watcher instance finished setting up', arguments);
        },
        change: function(changeType, filePath, fileCurrentStat, filePreviousStat) {
            console.log('a change event occured:', arguments);

            if (filePath.indexOf('.txt') > -1 || filePath.indexOf('publishChapter') > -1) {

                child = exec('./publishChapter',

                function(error, stdout, stderr) {
                    console.log('stdout: ' + stdout);
                    console.log('stderr: ' + stderr);
                    if (error !== null) {
                        console.log('exec error: ' + error);
                    }
                });
            }
        }
    },
    next: function(err, watchers) {
        // Watching all setup
        console.log('Now watching  our paths', arguments);

        //        // Close watchers after 10 seconds
        //        setTimeout(function(){
        //            var i;
        //            console.log('Stop watching our paths');
        //            for ( i=0;  i<watchers.length; i++ ) {
        //                watchers[i].close();
        //            }
        //        },10*1000);
    }
});