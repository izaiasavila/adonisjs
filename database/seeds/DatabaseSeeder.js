'use strict'

/*
|--------------------------------------------------------------------------
| DatabaseSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

const User = use('App/Models/User')

class DatabaseSeeder {
  async run () {
    const user = await User.create({
      username: 'izaias.filho',
      email: 'izaiasavila@gmail.com',
      password: '123'
    })

    await user.teams().create({
      name: 'SSM',
      user_id: user.id
    })
  }
}

module.exports = DatabaseSeeder
