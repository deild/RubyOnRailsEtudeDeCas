Expander = Class.create();
Expander.nextID = 0;
Expander.createExpandersForClass = function(className, options) {
  document.getElementsByClassName(className).each(function(el) {
    var ex = new Expander(Object.extend(options,{expandable: el}));
    new Insertion.Before(el, ex.buildString());
    Element.hide(el);
  });
}
Object.extend(Expander.prototype, {
  expandName: "Show",
  contractName: "Hide",
  expandPrefix: "Expander-expand-",
  contractPrefix: "Expander-contract-",
  initialize: function(args) {
    Object.extend(this, args);
    //this.constructor not working as expected on Safari, so:
    this.id = Expander.nextID++;
    //this.id = this.constructor.nextID++;
    //normalize this.expandable to a DOM ID, assigning if necessary
    if ($(this.expandable) == this.expandable) {
      var id = this.expandable.id;
      if (!id) {
        id = "expandable-" + this.id;
        this.expandable.id = id;
      }
      this.expandable = this.expandable.id;
    }
  },
  anchor: function(id, name, toggles) {
    var a = document.createElement("a");
    a.href ="#" + id;
    a.setAttribute("onclick", "Element.toggle('"+ toggles.join("','") +"'); return false;");
    a.id = id;
    a.innerHTML = name;
    return a;
  },
  buildDom: function() {
    var toggles = [this.contractPrefix + this.id, this.expandPrefix + this.id, this.expandable];
    var a1 = this.anchor(this.expandPrefix + this.id, 
                         this.expandName,
                         toggles);
    var a2 = this.anchor(this.contractPrefix + this.id, 
                         this.contractName, 
                         toggles);
    a2.style.display = "none";
    var span = document.createElement("span");
    span.appendChild(a1);
    span.appendChild(a2);            
    return span;     
  },
  buildString: function() {
    return this.buildDom().innerHTML;
  }
});
