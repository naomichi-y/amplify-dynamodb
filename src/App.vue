<template>
  <div id="app">
    <button @click="createNewTodo">Add Todo</button>
  </div>
</template>

<script>
import API, {  graphqlOperation } from '@aws-amplify/api';
// eslint-disable-next-line
import { createTodo } from "./graphql/mutations";
/*
Supported log levels for browser debugging:
ERROR
WARN
INFO
DEBUG
VERBOSE

@see https://aws-amplify.github.io/docs/js/logger
*/

window.LOG_LEVEL = 'VERBOSE';

export default {
  name: 'app',
  methods :{
    async createNewTodo() {
      const todo = { name: "Todo Title" , description: "あれをやる" + Date() }

      await API.graphql(graphqlOperation(createTodo, { input: todo }))
    }
  }
};
</script>
