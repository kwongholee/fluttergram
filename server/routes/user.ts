const router = require('express').Router();
import {Request, Response} from 'express';

router.post('/new', (req: Request, res: Response) => {
  res.send('post new user');
})

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