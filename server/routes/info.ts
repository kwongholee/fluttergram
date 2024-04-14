const router = require('express').Router();
import { Request, Response } from 'express';

router.get('/user', (req: Request, res: Response) => {
  res.send("user info");
})

router.get('/user/follower', (req: Request, res: Response) => {
  res.send("user follower info");
})

router.get('/message', (req: Request, res: Response) => {
  res.send("chatroom info");
})

router.get('/feed', (req: Request, res: Response) => {
  res.send("feed info");
})

module.exports = router;