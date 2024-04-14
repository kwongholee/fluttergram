const router = require('express').Router();
import { Request, Response } from "express";

router.post('/new', (req: Request, res: Response) => {
  res.send('make new chatroom');
})

router.post('/:groupid', (req: Request, res: Response) => {
  res.send('send new chat');
})

router.put('/:groupid/original', (req: Request, res: Response) => {
  res.send('edit my chat');
})

router.delete('/elimination/record/:groupid', (req: Request, res: Response) => {
  res.send('delete my chat');
})

router.delete('/elimination/:groupid', (req: Request, res: Response) => {
  res.send('delete chatroom');
})

module.exports = router;