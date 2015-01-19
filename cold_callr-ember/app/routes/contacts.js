import Ember from 'ember';
import { PaginationRouteMixin } from '../mixins/pagination-base';

export default Ember.Route.extend(PaginationRouteMixin,{
  queryParams: {
    sortBy: {
      refreshModel: true
    },
    status: {
      refreshModel: true
    },
    query: {
      refreshModel: true
    }
  },

  model: function(params) {
    return this.store.find('contact', {page: params.page, sort_by: params.sortBy, status: params.status, query: params.query});
  },

  //TODO: refactor to use https://github.com/simplabs/ember-simple-auth#readme
    actions: {
        error: function (error, transition) {
            if (error && error.status === 401 && error.statusText === "Unauthorized") {
                window.location.href = window.location.origin + "/users/sign_in"
            }
        }
    }
});
