const router = require('express').Router();
import { Request, Response } from "express";
var addFollow = require('../controller/follow/addFollow.controller');
var deleteFollow = require('../controller/follow/deleteFollow.controller');

router.post('/new', (req: Request, res: Response) => addFollow(req, res));

router.delete('/new', (req: Request, res: Response) => deleteFollow(req, res));

module.exports = router;