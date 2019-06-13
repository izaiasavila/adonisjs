'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ProjectAddTeamSchema extends Schema {
  up () {
    this.alter('projects', (table) => {
      table
        .integer('team_id')
        .unsigned()
        .references('id')
        .inTable('teams')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
    })
  }

  down () {
    this.alter('projects', (table) => {
      // reverse alternations
    })
  }
}

module.exports = ProjectAddTeamSchema
