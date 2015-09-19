// Modifies Prototype so that Ajax requests ask permission to go cross-site.
// Useful for pages that are run from the local filesystem.
CrossSite = {
  wrap: function(original) {
    return function() {
      try {
       netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
      } catch (e) {
        //alert("caught " + e);
      }
      original.apply(this, arguments);
    }
  }
}
Ajax.Request.prototype.initialize = CrossSite.wrap(Ajax.Request.prototype.initialize);
Ajax.Request.prototype.onStateChange = CrossSite.wrap(Ajax.Request.prototype.onStateChange);
Ajax.Updater.prototype.initialize = CrossSite.wrap(Ajax.Updater.prototype.initialize);