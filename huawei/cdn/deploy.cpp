#include "deploy.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <queue>
#define MAX_NODE 1200  //最大节点数
#define MAX_FLOW 5000000
#define MAXVAL 1000000
#define MAX_PATH_LEN MAX_NODE*20*100

using namespace std;

struct Edge
{
   int res_flow; //残余流量
   int total_flow; //总流量
   int perfee;    //单位费用
   int flow;      //流
   int demand;    //需求
};

int EdgeNums[MAX_NODE];
Edge edge[MAX_NODE][MAX_NODE];
Edge initEdge[MAX_NODE][MAX_NODE];

int  totals[3] ={0};//存放网络节点，链路个数，消费结点个数
int cost; //部署成本

int vst[MAX_NODE]; //用于标识节点是否在队列中/栈中
int Q[MAX_NODE];
int dis[MAX_NODE]; //存放到s点的路径长度
int pre[MAX_NODE]; //存放前驱结点
char *final_str = NULL;
int Net2ConsNode[MAX_NODE] = {-1};
int Cons2NetNode[MAX_NODE] = {-1};//保存消费节点与哪个网络节点直连
int resultPaths[MAX_PATH_LEN] = {-1}; // 存储最后的结果路径

int totalDemand = 0;    // 所有消费节点的总需求
int DCCost = 0;    // 直连后的总费用

struct EdgeNumIndex{
    int num;
    int index;
};

struct Deploy{
    int n_server;
    int* results;     // mincostmaxflow算法的返回值
    int* path;          // 最终结果路径
    int* serverNodes;   // 标志服务器的节点
    int* serverPos;     // 服务器实际位置
};


struct SeverNodes{
    int* nodes;
    int n_server;
};

/*
void print_array(int* array, int n, char msg[]=""){
    printf("%s\n", msg);
    for(int i=0;i<n;i++)
        printf("%d ", array[i]);
    printf("\n");
}
*/


//void init_edge()
//{
//}

//将文件的信息全部放在结构体中
void gen_Edge_Consumer(char * topo[MAX_EDGE_NUM],int totals[3],struct Edge edge[][MAX_NODE], int EdgeNums[])
{   

    //printf("start to gen_Edge_Consumer()\n");
    char *c;
    int i, j, k;
    int tmp[4];
    int spaceCount  = 0;

    c = topo[0];

    while (*c != '\0' && *c != '\n' && *c != '\r') 
    {
        if (*c == ' ') 
        {
            c++;
            spaceCount++;
            continue;
        }
            
        totals[spaceCount] = *c - '0' + totals[spaceCount] * 10;
        c++;
    }
    
    c = topo[2];
    spaceCount = 0;
    
    while (*c != '\0' && *c != '\n' && *c != '\r' && (spaceCount < 2)) 
    {
        if (*c == ' ') 
        {
            c++;
            spaceCount++;
            continue;
        }
        
        cost = *c - '0' + cost * 10;
        
        c++;
    }
    
    int estart[2] = {4, totals[1] + 5};
    int eend[2]   = {totals[1] + estart[0], estart[1] + totals[2]}; 
    
    for(i = 0; i<2; i++)
    {
        for(j = estart[i]; j< eend[i]; j++)
        {
            c = topo[j];
            spaceCount = 0;
            for(k = 0; k<4; k++)
                tmp[k] = 0;

            while (*c != '\0' && *c != '\n' && *c != '\r') 
            {
                if (*c == ' ') 
                {
                    c++;
                    spaceCount++;
                    continue;
                }
                
                tmp[spaceCount] = *c - '0' + tmp[spaceCount] * 10; 
                c++;
            }
            
            if(i == 0)
            {
                edge[tmp[0]][tmp[1]].total_flow = edge[tmp[1]][tmp[0]].total_flow = tmp[2];
                edge[tmp[0]][tmp[1]].res_flow = edge[tmp[1]][tmp[0]].res_flow = tmp[2];
                edge[tmp[0]][tmp[1]].flow = edge[tmp[1]][tmp[0]].flow = 0;
                edge[tmp[0]][tmp[1]].perfee = edge[tmp[1]][tmp[0]].perfee = tmp[3];     
                edge[tmp[0]][tmp[1]].demand = edge[tmp[1]][tmp[0]].demand = 0;     
                EdgeNums[tmp[0]]++; 
                EdgeNums[tmp[1]]++; 
            }
            
            if(i == 1)
            {   
                //超慧点
                edge[tmp[1]][totals[0]+totals[2]].total_flow = tmp[2]; 
                edge[tmp[1]][totals[0]+totals[2]].res_flow = tmp[2]; 
                edge[tmp[1]][totals[0]+totals[2]].flow = 0; 
                edge[tmp[1]][totals[0]+totals[2]].perfee = 0; 
                edge[tmp[1]][totals[0]+totals[2]].demand = tmp[2];
                
                
               // edge[tmp[1]][totals[0]].total_flow = tmp[2]; 
               // edge[tmp[1]][totals[0]].res_flow = tmp[2]; 
               // edge[tmp[1]][totals[0]].flow = 0; 
               // edge[tmp[1]][totals[0]].perfee = 0; 
               // edge[tmp[1]][totals[0]].demand = tmp[2];
                
                totalDemand += tmp[2];
                DCCost += cost;
                EdgeNums[tmp[1]]++;

                //保存消费结点和哪个网络结点直连
                //保存点网络节点和哪个消费结点直连
                Net2ConsNode[tmp[1]] = tmp[0];
                Cons2NetNode[tmp[0]] = tmp[1];

            }
        }
    }
    //printf("end to gen_Edge_Consumer()\n");
}



struct SeverNodes select_init_server(){
    //int n_server = int(ceil(totals[0]/10.0));
    int n_server = totals[2];
    int i;
    //int n_server = 3;
    struct SeverNodes videos_node;
    videos_node.nodes = (int* )malloc(sizeof(int)*totals[0]);
    memset(videos_node.nodes, 0, totals[0]*sizeof(int));
    printf("n_server:%d n_netnode:%d\n", n_server, totals[0]);

    printf("\n");
    //struct EdgeNumIndex* edgeNumIndex = sortEdgeCnt();

    /*
    for(int i=0; i<n_server; i++){

        videos_node.nodes[edgeNumIndex[i].index] = 1; 
        //printf("%d ", videos_node.nodes[edgeNumIndex[i].index]);
    }
    */
    for( i=0; i<n_server; i++){

        videos_node.nodes[Cons2NetNode[i]] = 1; 
        //printf("%d ", videos_node.nodes[edgeNumIndex[i].index]);
    }
    //printf("\n");
    videos_node.n_server = n_server;
    return videos_node;
}

int initOriginNode(int* videos_node, int n)
{   int i; 
    //添加超原点
//    memset(edge[totals[0]+totals[2]+1].total, );
    for( i =0;i<n; i++)
    {
        edge[totals[0]+totals[2]+1][videos_node[i]].total_flow = MAX_FLOW;
        edge[totals[0]+totals[2]+1][videos_node[i]].res_flow = MAX_FLOW;
        edge[totals[0]+totals[2]+1][videos_node[i]].flow = 0;
        edge[totals[0]+totals[2]+1][videos_node[i]].perfee = 0;
        edge[totals[0]+totals[2]+1][videos_node[i]].demand = 0;
        EdgeNums[totals[0]+totals[2]+1]++;

       // edge[totals[0]+1][videos_node[i]].total_flow = MAX_FLOW;
       // edge[totals[0]+1][videos_node[i]].res_flow = MAX_FLOW;
       // edge[totals[0]+1][videos_node[i]].flow = 0;
       // edge[totals[0]+1][videos_node[i]].perfee = 0;
       // edge[totals[0]+1][videos_node[i]].demand = 0;
       // EdgeNums[totals[0]+1]++;
    }

  return 1;
}



int getRandNum(){
    // 返回一个随机的网络节点编号，节点连接的边越多，返回的概率越大
    int i,j;
    int totalEdges = 0;
    for(i=0;i<totals[0];i++){
        totalEdges += EdgeNums[i];
    }
    int* a = (int*)malloc(sizeof(int)*totalEdges);
    int k = 0;
    for(i=0; i<totals[0];i++){
        for(j=0;j<EdgeNums[i];j++){
            a[k++] = i;
            //printf("%d\n",a[k-1]);
        }
    }
    int randNum = (rand()%totalEdges);

    return a[randNum]; 

}

int * intdup(const int * src, int len)
{
    int *p = NULL;
    p = (int* )malloc(len * sizeof(int));
    memcpy(p, src, len * sizeof(int));

    return p;
}

struct SeverNodes replace_servers(const int* videos_node, const int* videos_pos, int n){
    struct SeverNodes serverNode;
    int* tmp = intdup(videos_node, totals[0]);
    int rands;
    rands = rand()%n;
    int tt = 0;
    
    tmp[videos_pos[rands]] = 0;
            
    while(1)
    {
        tt  = getRandNum();
        if(tmp[tt] != 1)
        {
            tmp[tt] = 1;
            break;
        }
    }
    
    serverNode.nodes = tmp;
    serverNode.n_server = n;

    return serverNode;
}

struct SeverNodes up_servers(const int* videos_node, const int* videos_pos, int n, double possible=0.1){
    struct SeverNodes serverNode;
    int* tmp = intdup(videos_node, totals[0]);
    int cnt = 0;
    if(totals[0]<250){
        possible = 0.5;  
	cnt = 1;
    }else if(totals[0]>=250 && totals[0]<500){
        possible = 0.30;  
	cnt = 1;
    }else{
        possible = 0.20;
	cnt = 4; 
    }
   // printf("posssible=%f\n", possible);
    //int randNum = getRandNum();
    int randNum=0;
    double randFloat = 0.0;
    int c = 0;
    //srand((unsigned)time(NULL));
    while(c++<cnt){
    randFloat = (double)rand() / (double) RAND_MAX;
    if(randFloat > possible){
        randNum = rand()%n;
       if(tmp[videos_pos[randNum]] != 0){
	 tmp[videos_pos[randNum]]   = 0;
         n--;
	}
    }else{
         randNum = getRandNum(); 
        if(tmp[randNum] == 0)
        {
            tmp[randNum] = 1;
            n++;
        } 
    }
   }
   // printf("\ncur rand:%d float%.2f\n", randNum, randFloat);

    serverNode.nodes = tmp;
    serverNode.n_server = n;

    return serverNode;
}


int* cal_servers_posi(int* videos_node, int n_server){
    int* videos_pos = (int*)malloc(n_server*sizeof(int));
    int i, j;
    for(i=0, j=0; i<totals[0]; i++){
        if(videos_node[i]==1){
            videos_pos[j++] = i; 
        }
    }
    return videos_pos;
}

//s为原点，进过节点e，通过的费用是v
int relax(int s, int e, int v)
{
    if (dis[s]+v < dis[e])
    {
        dis[e] = dis[s] + v;
        return 1;
    }
    return 0;
}

int SPFA(int s)
{
    int p,j;
    struct Edge tt;

    //初始化dis,pre以及vst 
    memset(dis, MAXVAL, sizeof(int)*MAX_NODE);
    memset(pre, -1, sizeof(int)*MAX_NODE);
    memset(vst, 0, sizeof(int)*MAX_NODE);
    memset(Q, -1,sizeof(int)*MAX_NODE); 
    //init();
    queue<int> Q;
    
    //相当于栈中0号位置存放的是s0
    dis[s] = 0;
    Q.push(s);
    //Q[0] = s;
    //top = 1;
    vst[s] = 1;
    
    //while(top)
    while(!Q.empty())
    {
        //将节点取出,并将vst置为0
       // t = Q[--top];
        int t = Q.front();
        Q.pop();
        vst[t] = 0;
        p   = 1;

        for(j=0; j<=totals[0]+totals[2]; j++)
       // for(j=0; j<=totals[0]; j++)
        {
            //此处需要修改1，当vst[j] == 1时，实际p也应该+1
            //通过数据的生成来看，数据应该按照广度遍历更好！
            if((edge[t][j].res_flow != 0)&&(t != j))
            {
                tt = edge[t][j];//获取和t直连的结点 
                //松弛操作 
                if(relax(t, j, tt.perfee))
                {
                    if(vst[j]==0)
                        Q.push(j);
            //            Q[top++] = j;
                    pre[j]  = t; 
                    vst[j] = 1;
                }       
                
                p++;
                if (p > EdgeNums[t]) break;
            }
        }
    }

    return 1;
}



int* MinCostMaxFlow(int s, int t, int n_server)
{   
    int tt = 0;
    int *result = new int[3]; 
    int min_res_flow;	
    int cnt = 0;
    int sum = 0;
    int i; 
    for(i = 0;i<3;i++)
        result[i] = 0;

   // for(int i = 0;i<MAX_EDGE_NUM;i++)
   // {
   //     resultPaths[i] = -1;
   // }
    
    memset(resultPaths, -1, sizeof(int)*MAX_PATH_LEN);

    SPFA(s);
    
    int pathIndex = 0;
    while(pre[t] !=-1)
    {
        min_res_flow = MAX_FLOW;

        int u = pre[t];
        int v = t;

        while(u != -1)
        {
            if(min_res_flow > edge[u][v].res_flow){
                min_res_flow = edge[u][v].res_flow;
            }
            
            v = u;
            u = pre[v];
        }

        u = pre[t];
        v = t;
         
        while(u !=-1)
        {
           // printf("%d<-%d",v,u);
            
            if(v == totals[0]+totals[2]){
           // if(v == totals[0]){
                //resultPaths[pathIndex++] = edge[u][totals[0]+totals[2]].demand;
                resultPaths[pathIndex++] = min_res_flow;
                resultPaths[pathIndex++] = Net2ConsNode[u];
            }
            resultPaths[pathIndex++] = u;
            
            edge[u][v].flow += min_res_flow;
            edge[v][u].flow = -edge[u][v].flow;
            edge[u][v].res_flow = edge[u][v].total_flow - edge[u][v].flow;
            edge[v][u].res_flow = - edge[v][u].flow;
            //edge[v][u].res_flow = edge[v][u].total_flow - edge[v][u].flow;
             
            sum += min_res_flow*edge[u][v].perfee; //计算代价
            v = u;
            u = pre[u];
            
           // printf("<-");
        }
        
      //  printf("\tfee = %d, flow = %d\n",sum, min_res_flow);
        
        SPFA(s);
        cnt++;
    }
   // for(int i =0 ;i<pathIndex-1;i++){
   //     printf("%d ",resultPaths[i]);
   // }
   // printf("\n\n");
    
    
    //得到总需求,总费用
    for(i = 0;i< MAX_NODE; i++)
    {
        if(edge[i][totals[0]+totals[2]].demand != 0)
            tt += edge[i][totals[0]+totals[2]].flow;     
       // if(edge[i][totals[0]].demand != 0)
       //     tt += edge[i][totals[0]].flow;     
    }
        
    result[0] = tt;
    result[1] = sum+n_server*cost;
    result[2] = cnt; 

    return result;

}

void deployDup(struct Deploy* to, const struct Deploy* from){
    to->n_server = from->n_server;
    //print_array(from->serverNodes, totals[0],"ddd" );
    //printf("%d", sizeof(from->serverNodes)/sizeof(int));
    to->serverNodes = intdup(from->serverNodes, totals[0]);
    to->serverPos = intdup(from->serverPos, from->n_server);
    to->results = intdup(from->results, 3);
}

// 从状态from转移到状态to
void upDeploy(struct Deploy* from, struct Deploy* to){
    struct SeverNodes severNode = up_servers(from->serverNodes, from->serverPos, from->n_server);
    to->n_server = severNode.n_server;
    to->serverNodes = severNode.nodes;
    to->serverPos = cal_servers_posi(severNode.nodes, severNode.n_server);
}



void deploy_server(char * topo[MAX_EDGE_NUM], int line_num,char * filename)
{
    srand((unsigned)time(NULL));
    //初始化边的信息
    //printf("Start to deploy server!");
    clock_t start, end;
    final_str = (char*)malloc(100000*sizeof(char));
    
    start = clock();
    //init_edge();
    memset(edge, 0, sizeof(Edge)*MAX_NODE*MAX_NODE);
    //信息存到具体的结构中
    gen_Edge_Consumer(topo, totals, edge, EdgeNums);
    //resetEdge();
    memcpy(initEdge, edge, sizeof(Edge)*MAX_NODE*MAX_NODE);

    struct Deploy lastDeploy;
    struct SeverNodes tmpNode = select_init_server();
    struct Deploy bestDeploy;

    lastDeploy.n_server = tmpNode.n_server;
    lastDeploy.serverNodes = tmpNode.nodes;
    lastDeploy.serverPos = cal_servers_posi(lastDeploy.serverNodes, lastDeploy.n_server);
    initOriginNode(lastDeploy.serverPos, lastDeploy.n_server);  // 初始话超原点设置
    lastDeploy.results = MinCostMaxFlow(totals[0]+totals[2]+1,totals[0]+totals[2], lastDeploy.n_server);
   // lastDeploy.results = MinCostMaxFlow(totals[0]+1,totals[0], lastDeploy.n_server);
    deployDup(&bestDeploy, &lastDeploy);

    struct Deploy curDeploy;
    struct SeverNodes severNode = up_servers(lastDeploy.serverNodes, lastDeploy.serverPos, lastDeploy.n_server);
    curDeploy.n_server = severNode.n_server;
    curDeploy.serverNodes = severNode.nodes;
    curDeploy.serverPos = cal_servers_posi(severNode.nodes, severNode.n_server);

    //float T=5000.0, T_min=1.0, r=0.995, K=1.38065*pow(10,-23), dE=0;

    int n_succ = 0, n_iter = 0, best_iter=0;
    int MAX_ITER = 10000, min_cost=1000000000;
    int n_loop[3] = {0,0,0};
    int tmp_cnt = 0;
    int min_n_server = 0;
    int i;
    double dir = 0;
    while(n_iter<MAX_ITER&& dir < 89){
        printf("\n\nepoch-%d\n", n_iter++);
        //print_array(lastDeploy.serverPos, lastDeploy.n_server, "last servers:");
        //print_array(curDeploy.serverPos, curDeploy.n_server, "cur servers:");
	memcpy(edge, initEdge, sizeof(Edge)*MAX_NODE*MAX_NODE);
        initOriginNode(curDeploy.serverPos, curDeploy.n_server);  // 初始话超原点设置
        curDeploy.results = MinCostMaxFlow(totals[0]+totals[2]+1,totals[0]+totals[2], curDeploy.n_server);
       // curDeploy.results = MinCostMaxFlow(totals[0]+1,totals[0], curDeploy.n_server);

       // printf("结果链路行数:%d\n",curDeploy.results[2]);
        printf("cost:%d, demand:%d\n", curDeploy.results[1], curDeploy.results[0]);


        if(totalDemand==curDeploy.results[0]){
            if(curDeploy.results[1] < min_cost){
                printf("step into loop-0!!!!\n");
                deployDup(&bestDeploy, &curDeploy);
                deployDup(&lastDeploy, &curDeploy);
                bestDeploy.path = intdup(resultPaths, MAX_PATH_LEN);
                best_iter = n_iter;
                min_cost = bestDeploy.results[1];
                min_n_server = bestDeploy.n_server;
                //print_array(bestDeploy.serverPos, bestDeploy.n_server, "best servers:");
            }else{
                printf("step into loop-1\n");
                deployDup(&lastDeploy, &curDeploy);
                deployDup(&curDeploy, &bestDeploy);
            }
            upDeploy(&curDeploy, &curDeploy);
            n_succ++;
            n_loop[0]++;
        }else{
            printf("step into loop-2\n");
            deployDup(&curDeploy, &bestDeploy);
            severNode = replace_servers(curDeploy.serverNodes, curDeploy.serverPos, curDeploy.n_server);
            curDeploy.serverNodes = severNode.nodes;
            curDeploy.n_server = severNode.n_server;
            curDeploy.serverPos = cal_servers_posi(severNode.nodes, severNode.n_server);
            n_loop[2]++;
        }
    printf("mincost:%d\n", min_cost);
    printf("minirer:%d\n", best_iter);
    printf("best_n_server:%d\n", min_n_server);
    end = clock();
    dir = (double)(end - start)/CLOCKS_PER_SEC;
    }
    
    //print_array(n_loop, 3, "loop cnt");
    printf("tmp_cnt%d\n", tmp_cnt);
    printf("DCCost:%d\n", DCCost);

    if(n_succ>=1){
        printf("\nnsucc:%d,fail:%d, min_cost:%d, min_n_server:%d, best-iter:%d, totalDemand%d\n\n", n_succ, n_iter-n_succ,bestDeploy.results[1], bestDeploy.n_server, best_iter, totalDemand);
        // 分隔每条路径
        memcpy(resultPaths, bestDeploy.path, sizeof(int)*MAX_PATH_LEN);
        int* results = intdup(bestDeploy.results, 3);
        int* pos = (int*)malloc(sizeof(int)*MAX_PATH_LEN);
        pos[0] = 0;
        int p = 1;
        for(i=0; resultPaths[i]!=-1; i++){
            if(resultPaths[i]==totals[0]+totals[2]+1){
           // if(resultPaths[i]==totals[0]+1){
                pos[p++] = i;
            }
        }
        
        // 打印结果路径
        char tmp[10];
	    int ii;
        printf("%d\n", results[2]);
        sprintf(tmp, "%d\n", results[2]);
        strcat(final_str, tmp);
        for(i=0; i<p-1; i++){
            printf("\n");
            strcat(final_str, "\n");
            for(ii=pos[i+1]-1; ii>pos[i]; ii--){
               printf("%d ", resultPaths[ii]);
               sprintf(tmp, "%d ", resultPaths[ii]);
               strcat(final_str, tmp);
            }
            if(i==0){
                printf("%d ", resultPaths[0]);
                sprintf(tmp, "%d ", resultPaths[0]);
                strcat(final_str, tmp);
            }
        }
        printf("\nnsucc:%d,fail:%d, min_cost:%d, min_n_server:%d, best-iter:%d, totalDemand%d\n\n", n_succ, n_iter-n_succ,bestDeploy.results[1], bestDeploy.n_server, best_iter, totalDemand);
    }else{
        printf("\ntotalDemand:%d\n", totalDemand);
        printf("\nVariable path is not found!!!\n");
        strcat(final_str, "NA");
    }
    
    printf("Done all!");
	// 直接调用输出文件的方法输出到指定文件???ps请注意格式的正确性，如果有解，第一行只有一个数据；第二行为空；第三行开始才是具体的数据，数据之间用一个空格分隔开)
	write_result(final_str, filename);
}
