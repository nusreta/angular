# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./Controllers/main
#= require_tree ./Services/main

# Creates new Angular module called 'Blog'
Blog = angular.module('Blog', [])

# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post/'
  $routeProvider
    .when('/post/new', { templateUrl: '../assets/mainCreatePost.html', controller: 'CreatePostCtrl' } )
    .when('/post/:postId', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )
  .when('/cv/new', { templateUrl: '../assets/mainCreateCv.html', controller: 'CreateCvCtrl' } )
  .when('/cv/:cvId', { templateUrl: '../assets/mainCv.html', controller: 'CvCtrl' } )
  .when('/cv/:cvId/edit', { templateUrl: '../assets/mainEditCv.html', controller: 'EditCvCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])

Blog.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])