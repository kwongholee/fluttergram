var feedModel = require('../../model/feed');
import { Request, Response } from 'express';

const editFeed = async (req: Request, res: Response) => {
  var id = req.params.id;
  var content = req.body;
  try {
    await feedModel.findByIdAndUpdate(id, {
      introduce: content.introduce
    }).exec();
    return res.status(200);
  } catch(err) {
    console.log(err);
    return res.status(400);
  }
}

module.exports = editFeed;