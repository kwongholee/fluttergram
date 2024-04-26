const router = require('express').Router();
var addUser = require('../controller/user/addUser.controller');
var logIn = require('../controller/user/logIn.controller');
import {Request, Response} from 'express';

router.post('/login/check', (req: Request, res: Response) => logIn(req, res));

router.post('/new', (req: Request, res: Response) => addUser(req, res));

router.put('/original', (req: Request, res: Response) => {
  res.send('edit original user');
})

router.delete('/original/secession', (req: Request, res: Response) => {
  res.send('delete original user');
})

router.put('/follower', (req: Request, res: Response) => {
  res.send('edit follower');
})

module.exports = router;