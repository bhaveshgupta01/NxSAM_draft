import 'dart:async';
import 'dart:convert';

class VulData{
  final String name;
  final String link;
  final List<List<String>> Artifacts;
  final List<String> Comment;
  final List<String> CommentAuthor;
  final int priority;
  final bool approved;

  const VulData({
    required this.name,
    required this.link,
    required this.Artifacts,
    required this.Comment,
    required this.CommentAuthor,
    required this.priority,
    required this.approved,
  });
}

List<VulData> fetchData()
{
  List<VulData> VulList=[
    const VulData(name: 'Cross Site Request Forgery (CSRF)',
      link: 'http://abcd.com',
      Artifacts: [['HTML Injection POC','HTML Injection POC']],
      Comment: ['form tag issues','form tag issues','form tag issues',],
      CommentAuthor: ['bala','bala','bala',],
      approved: false, priority: 2,),
    const VulData(name: 'Cross Site Request Forgery (CSRF)',
      link: 'http://abcd.com',
      Artifacts: [['HTML Injection POC'],
        ['HTML Injection POC','HTML Injection POC','HTML Injection POC'],
        ['HTML Injection POC','HTML Injection POC']],
      Comment: ['form tag issues','form tag issues','form tag issues',],
      CommentAuthor: ['bala','bala','bala',],
      approved: true, priority: 1,),
    const VulData(name: 'Cross Site Request Forgery (CSRF)',
      link: 'http://abcd.com',
      Artifacts: [['HTML Injection POC','HTML Injection POC']],
      Comment: ['form tag issues','form tag issues','form tag issues',],
      CommentAuthor: ['bala','bala','bala',],
      approved: false, priority: 3,),
  ];

  return VulList;
}