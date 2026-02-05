module.exports = (req, res, next) => {
  const { body, deadline } = req.body

  if (!body || !dedline) {
    return res.status(400).json({
      messege: 'body and dedline are required'
    })
  }

  next()
}
