var gulp = require('gulp'),
    browserify = require('browserify'),
    es6ify = require('es6ify'),
    source = require('vinyl-source-stream'),
    watchify = require('watchify');

gulp.task('build', function () {
    var bundler = browserify({
        basedir: __dirname,
        extensions: ['.js'],
        debug: global.isDevelopment,
        cache: {},
        packageCache: {},
        fullPaths: global.isWatching
    }).add(es6ify.runtime)
        .transform(es6ify)
        .require(require.resolve('./bootstrap.js'), {entry: true});

    var bundle = function () {
        return bundler
            .bundle()
            .pipe(source('bundle.js'))
            .pipe(gulp.dest('./bundle'));
    };

    if (global.isWatching) {
        bundler = watchify(bundler);
        bundler.on('update', bundle);
    }
    return bundle();
});

gulp.task('setWatch', function () {
    global.isWatching = true;
});

gulp.task('setDevelopment', function () {
    global.isDevelopment = true;
});

gulp.task('default', ['setDevelopment', 'build']);
gulp.task('watch', ['setDevelopment', 'setWatch', 'build']);
gulp.task('release', ['build']);
