const router = require('express').Router();
import { Request, Response } from "express";
var addChatroom = require('../controller/chatroom/addChatroom.controller');
var deleteChatroom = require('../controller/chatroom/deleteChatroom.controller');
var addChat = require('../controller/chat/addChat.controller');
var editChat = require('../controller/chat/editChat.controller');
var deleteChat = require('../controller/chat/deleteChat.controller');

router.post('/new', (req: Request, res: Response) => addChatroom(req, res));

router.post('/:groupid', (req: Request, res: Response) => addChat(req, res));

router.put('/:groupid/original', (req: Request, res: Response) => editChat(req, res));

router.delete('/elimination/record/:groupid', (req: Request, res: Response) => deleteChat(req, res));

router.delete('/elimination/:groupid', (req: Request, res: Response) => deleteChatroom(req, res));

module.exports = router;