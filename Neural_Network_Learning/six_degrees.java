/**
 * Definition for Undirected graph.
 * class UndirectedGraphNode {
 *     int label;
 *     List<UndirectedGraphNode> neighbors;
 *     UndirectedGraphNode(int x) { 
 *         label = x;
 *         neighbors = new ArrayList<UndirectedGraphNode>(); 
 *     }
 * };
 */
public class Solution {
    /**
     * @param graph a list of Undirected graph node
     * @param s, t two Undirected graph nodes
     * @return an integer
     */
    public int sixDegrees(List<UndirectedGraphNode> graph,
                          UndirectedGraphNode s,
                          UndirectedGraphNode t) {
        Map<UndirectedGraphNode, Integer> hash = new HashMap<UndirectedGraphNode, Integer>();
        hash.put(s,0);
        Queue<UndirectedGraphNode> q = new LinkedList<UndirectedGraphNode>();
        q.offer(s);
        while (!q.isEmpty()) {
            UndirectedGraphNode currNode = q.poll();
            if (currNode.label == t.label) {
                return hash.get(currNode);
            }
            for(UndirectedGraphNode node : currNode.neighbors) {
                if (!hash.containsKey(node)) {
                    hash.put(node, hash.get(currNode) + 1);
                    q.offer(node);
                }
            }
        }
        return -1;
    }
}