define("cold-callr-ember/app",["ember","ember/resolver","ember/load-initializers","exports"],function(e,t,r,a){"use strict";var o=e["default"],l=t["default"],n=r["default"];o.MODEL_FACTORY_INJECTIONS=!0;var c=o.Application.extend({modulePrefix:"cold-callr-ember",Resolver:l});n(c,"cold-callr-ember"),a["default"]=c}),define("cold-callr-ember/config/environment",["exports"],function(e){"use strict";e["default"]={environment:"production",baseURL:"/",locationType:"auto",EmberENV:{FEATURES:{}},APP:{}}}),define("cold-callr-ember/config/environments/production",["exports"],function(e){"use strict";e["default"]={environment:"production",baseURL:"/",locationType:"auto",EmberENV:{FEATURES:{}},APP:{}}}),define("cold-callr-ember/models/contact",["ember-data","exports"],function(e,t){"use strict";var r=e["default"];t["default"]=r.Model.extend({name:r.attr(),phone:r.attr(),doNotCall:r.attr("boolean"),properties:r.attr()})}),define("cold-callr-ember/router",["ember","exports"],function(e,t){"use strict";var r=e["default"],a=r.Router.extend({location:ColdCallrEmberENV.locationType});a.map(function(){this.resource("contact",{path:"contacts/:contact_id"})}),t["default"]=a}),define("cold-callr-ember/routes/contact",["ember","exports"],function(e,t){"use strict";var r=e["default"];t["default"]=r.Route.extend({})}),define("cold-callr-ember/templates/application",["ember","exports"],function(e,t){"use strict";var r=e["default"];t["default"]=r.Handlebars.template(function(e,t,a,o,l){this.compilerInfo=[4,">= 1.0.0"],a=this.merge(a,r.Handlebars.helpers),l=l||{};var n,c="";return l.buffer.push("<h2 id='title'>Welcome to ColdCallr</h2>\n\n"),n=a._triageMustache.call(t,"outlet",{hash:{},hashTypes:{},hashContexts:{},contexts:[t],types:["ID"],data:l}),(n||0===n)&&l.buffer.push(n),l.buffer.push("\n"),c})}),define("cold-callr-ember/templates/contact",["ember","exports"],function(e,t){"use strict";var r=e["default"];t["default"]=r.Handlebars.template(function(e,t,a,o,l){this.compilerInfo=[4,">= 1.0.0"],a=this.merge(a,r.Handlebars.helpers),l=l||{};var n,c="";return n=a._triageMustache.call(t,"outlet",{hash:{},hashTypes:{},hashContexts:{},contexts:[t],types:["ID"],data:l}),(n||0===n)&&l.buffer.push(n),l.buffer.push("\n"),c})});