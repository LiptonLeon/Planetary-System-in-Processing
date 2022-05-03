// Node has children than need to be updated
abstract class Node implements Updateable{
  
  List<Node> children;
  
  Node() {
    children = new ArrayList<Node>();
  }
  
  // Call every frame
  void update(float delta){}
  
  Node getChild(int id){
    return children.get(id);
  }
  
  void addChild(Node child){
    children.add(child);
  }

}
