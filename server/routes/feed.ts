const router = require('express').Router();
import { Request, Response } from "express";
var addFeed = require('../controller/addFeed.controller');
var editFeed = require('../controller/feed/editFeed.controller');
var deleteFeed = require('../controller/feed/deleteFeed.controller');

router.post('/new', (req: Request, res: Response) => addFeed(req, res));

router.put('/original', (req: Request, res: Response) => editFeed(req, res));

router.delete('/original/elimination', (req: Request, res: Response) => deleteFeed(req, res));

module.exports = router;