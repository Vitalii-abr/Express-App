const { v4: uuidv4 } = require('uuid')
const tasks = require('../data/tasks')

exports.getAllTasks = (req, res) => {
  res.json(tasks)
}

exports.getTaskById = (req, res) => {
  const task = tasks.find(t => t.id === req.params.id)
  if (!task) {
    return res.status(404).json({ message: 'Task not found' })
  }
  res.json(task)
}

exports.createTask = (req, res) => {
  const { body, deadline } = req.body

  const newTask = {
    id: uuidv4(),
    body,
    deadline,
    isDone: false
  }

  tasks.push(newTask)
  res.status(201).json(newTask)
}

exports.updateTask = (req, res) => {
  const task = tasks.find(t => t.id === req.params.id)
  if (!task) {
    return res.status(404).json({ message: 'Task not found' })
  }

  const { body, deadline, isDone } = req.body

  if (body !== undefined) task.body = body
  if (deadline !== undefined) task.deadline = deadline
  if (isDone !== undefined) task.isDone = isDone

  res.json(task)
}

exports.deleteTask = (req, res) => {
  const index = tasks.findIndex(t => t.id === req.params.id)
  if (index === -1) {
    return res.status(404).json({ message: 'Task not found' })
  }

  tasks.splice(index, 1)
  res.json({ message: 'Task deleted' })
}
