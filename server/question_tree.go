package server

type QBTreeNode struct {
	Question Question    `json:"question"`
	Left     *QBTreeNode `json:"left"`
	Right    *QBTreeNode `json:"right"`
}
