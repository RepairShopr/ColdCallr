module.exports = {
  name: 'third-party-script',

  isDevelopingAddon: function() {
    return true;
  },

  scripts: function(config) {
    return [
      // include an array of vendor scripts here.
    ]
  },

  contentFor: function (type, config) {
    var content = '';

    if (type=== 'head') {
      content = this.scripts(config).join('\n');
    }

    return content
  }
};
