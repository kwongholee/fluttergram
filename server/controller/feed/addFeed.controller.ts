var feedModel = require('../../model/feed');
import { Request, Response } from 'express';

const addFeed = async (req: Request, res: Response) => {
  try {
    if (!req.body || typeof req.body !== 'object') {
      throw new Error('Invalid request body');
    }

    var data: any = req.body;

    var newFeed = new feedModel({
      "id": data.id,
      "writer": data.writer,
      "introduce": data.introduce,
      "like": data.like
    });
    await newFeed.save();
    console.log(newFeed);
    res.status(200).json({message: "ok"});
  } catch(err) {
    console.log(err);
    res.status(400).json({message: "rejected"});
  }
}

module.exports = addFeed;