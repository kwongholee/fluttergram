var feedModel = require('../../model/feed');
import { Request, Response } from 'express';

const deleteFeed = async (req: Request, res: Response) => {
  var id = req.params.id;
  try {
    await feedModel.findByIdAndDelete(id);
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
}

module.exports = deleteFeed;