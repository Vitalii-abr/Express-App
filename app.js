const express = require('express')
const tasksRoutes = require('./routes/tasks.routes')
const errorHandler = require('./middlewares/errorHandler')

const app = express()
app.use(express.json())

app.use('/tasks', tasksRoutes)

app.use(errorHandler)

app.listen(3000, () => {
  console.log('Server started on port 3000')
})
