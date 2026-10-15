function notFound(req, res) {
    res.status(404).send(`Route ${req.method} ${req.originalUrl} not found`);
}

module.exports = notFound;