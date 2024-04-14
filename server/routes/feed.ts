const router = require('express').Router();
import { Request, Response } from "express";

router.post('/new', (req: Request, res: Response) => {
  res.send('post new feed');
})

router.put('/original', (req: Request, res: Response) => {
  res.send('edit original feed');
})

router.delete('/original/elimination', (req: Request, res: Response) => {
  res.send('delete original feed');
})

module.exports = router;