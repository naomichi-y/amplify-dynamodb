<template>
  <div id="app">
    <button @click="createNewTodo">Add Todo</button>
    <ul>
      <li v-for="todo in todos" :key="todo.id">
        {{todo.name}} - {{todo.description}}
      </li>
    </ul>
  </div>
</template>

<script>
import API, {  graphqlOperation } from '@aws-amplify/api';
// eslint-disable-next-line
import { createTodo } from "./graphql/mutations";
import { listTodos } from './graphql/queries'
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
  data() {
    return {
      todos: []
    }
  },
  methods :{
    async createNewTodo() {
      const todo = { name: "Todo Title" , description: "あれをやる" + Date() }

      await API.graphql(graphqlOperation(createTodo, { input: todo }))
    },
    async getData() {
      const todoData = await API.graphql(graphqlOperation(listTodos))

      this.todos.push(...this.todos, ...todoData.data.listTodos.items);
    },
  },
  created(){
    this.getData()
  }
};
</script>
