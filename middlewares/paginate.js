module.exports = (req, res, next) => {
  const page = Number(req.query.page) || 1
  const results = Number(req.query.results) || 5

  req.pagination = {
    page,
    results,
    start: (page - 1) * results,
    end: page * results
  }

  next()
}
