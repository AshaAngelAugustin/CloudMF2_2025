# Wipro .NET Facets Role - Interview Preparation Guide

## Table of Contents
1. [Tell Me About Yourself](#tell-me-about-yourself)
2. [Core .NET Questions](#core-net-questions)
3. [SQL Server Questions](#sql-server-questions)
4. [TriZetto Facets Questions](#trizetto-facets-questions)
5. [Healthcare Domain Questions](#healthcare-domain-questions)
6. [EDI & Integration Questions](#edi--integration-questions)
7. [Scenario-Based Questions](#scenario-based-questions)
8. [Wipro Specific Questions](#wipro-specific-questions)
9. [Project Experience Questions](#project-experience-questions)
10. [Preparation Tips](#preparation-tips)

---

## Tell Me About Yourself

### Professional Response (60-90 seconds):
*"I'm a seasoned IT professional with 10 years of hands-on experience in .NET development and SQL database management, with specific expertise in healthcare IT systems. Throughout my career, I've successfully delivered enterprise-level applications using the full .NET stack - from ASP.NET web applications to Web APIs and microservices.*

*My expertise spans across:*
- *Backend Development: Proficient in C#, .NET Framework/.NET Core, Web APIs, and enterprise architecture*
- *Database Management: Extensive experience with SQL Server, including complex healthcare data models, performance optimization, and ETL processes*
- *Healthcare Systems: Experience with claims processing, member management, and healthcare compliance requirements*

*What sets me apart is my ability to understand complex healthcare business rules and translate them into robust technical solutions. I've worked on large-scale systems processing millions of transactions, ensuring data accuracy and regulatory compliance.*

*I'm particularly interested in this Wipro opportunity because it combines my technical .NET expertise with healthcare domain knowledge, allowing me to contribute to meaningful projects that impact patient care and healthcare operations."*

---

## Core .NET Questions

### 1. **What's the difference between .NET Framework and .NET Core?**
**Answer:**
- **.NET Framework**: Windows-only, mature, full-featured framework with extensive library support
- **.NET Core**: Cross-platform, open-source, lightweight, better performance, cloud-ready
- **.NET 5+**: Unified platform combining both, single runtime for all applications

### 2. **Explain the Common Language Runtime (CLR)**
**Answer:**
CLR is the execution environment that:
- Manages memory allocation and garbage collection
- Handles exception management
- Provides type safety and security
- Enables language interoperability
- Compiles IL code to native code via JIT compilation

### 3. **Value Types vs Reference Types**
**Answer:**
- **Value Types**: Stored on stack, contains actual data, examples: int, bool, struct
- **Reference Types**: Stored on heap, contains reference to memory location, examples: class, interface, delegate

### 4. **Abstract Class vs Interface**
**Answer:**
- **Abstract Class**: Can have implementation, single inheritance, can have constructors, access modifiers
- **Interface**: Contract only (C# 8+ allows default implementation), multiple inheritance, public by default

### 5. **Garbage Collection and Generations**
**Answer:**
- **Generation 0**: Short-lived objects, collected frequently
- **Generation 1**: Medium-lived objects, survived one collection
- **Generation 2**: Long-lived objects, collected less frequently
- **Large Object Heap**: Objects > 85KB

### 6. **SOLID Principles**
**Answer:**
- **S**ingle Responsibility: One class, one responsibility
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Derived classes should be substitutable
- **I**nterface Segregation: Many specific interfaces better than one general
- **D**ependency Inversion: Depend on abstractions, not concretions

### 7. **Delegates and Events**
**Answer:**
- **Delegate**: Type-safe function pointer, can point to multiple methods
- **Event**: Special kind of delegate, provides publisher-subscriber pattern
- **Multicast**: Can invoke multiple methods through single delegate

### 8. **IEnumerable vs IQueryable**
**Answer:**
- **IEnumerable**: In-memory collections, LINQ to Objects, immediate execution
- **IQueryable**: Queryable data sources, LINQ to SQL/EF, deferred execution, expression trees

---

## SQL Server Questions

### 9. **Clustered vs Non-Clustered Indexes**
**Answer:**
- **Clustered**: Physical ordering of data, one per table, leaf level contains actual data
- **Non-Clustered**: Logical ordering, multiple per table, leaf level contains pointers to data

### 10. **Stored Procedures vs Functions**
**Answer:**
- **Stored Procedures**: Can modify data, multiple result sets, no return value restriction
- **Functions**: Read-only, single return value, can be used in SELECT statements

### 11. **ACID Properties**
**Answer:**
- **Atomicity**: All or nothing transaction
- **Consistency**: Database remains in valid state
- **Isolation**: Concurrent transactions don't interfere
- **Durability**: Committed changes are permanent

### 12. **Normalization Forms**
**Answer:**
- **1NF**: Eliminate repeating groups
- **2NF**: Eliminate partial dependencies
- **3NF**: Eliminate transitive dependencies
- **BCNF**: Every determinant is a candidate key

### 13. **UNION vs UNION ALL**
**Answer:**
- **UNION**: Removes duplicates, slower performance
- **UNION ALL**: Keeps duplicates, faster performance

### 14. **Triggers and Types**
**Answer:**
- **AFTER**: Executes after triggering event
- **INSTEAD OF**: Replaces triggering event (used with views)
- **DDL**: Database structure changes
- **DML**: Data modification (INSERT, UPDATE, DELETE)

---

## TriZetto Facets Questions

### 15. **What is TriZetto Facets?**
**Answer:**
TriZetto Facets is a comprehensive healthcare management system that includes:
- Core administration for health plans
- Claims processing and adjudication
- Member and provider management
- Financial management and reporting
- Regulatory compliance tools

### 16. **Claims Processing Workflow in Facets**
**Answer:**
1. **Claim Receipt**: EDI 837 or paper claims
2. **Initial Validation**: Format and basic rule checks
3. **Member Eligibility**: Verify coverage and benefits
4. **Provider Validation**: Check network status and contracts
5. **Medical Necessity**: Prior authorization checks
6. **Benefit Calculation**: Apply deductibles, copays, coinsurance
7. **Coordination of Benefits**: Secondary payer processing
8. **Adjudication**: Approve, deny, or pend for review
9. **Payment Processing**: Generate payment or denial
10. **Reporting**: Claims reporting and analytics

### 17. **COB (Coordination of Benefits)**
**Answer:**
Process to determine payment responsibility when member has multiple insurance coverage:
- **Primary**: Pays first according to benefit structure
- **Secondary**: Pays remaining amount up to their benefit limits
- **Birthday Rule**: For dependent children, parent with earlier birthday is primary

### 18. **Medical vs Pharmacy Claims**
**Answer:**
- **Medical Claims**: Professional services, facility services, processed through medical benefit structure
- **Pharmacy Claims**: Prescription drugs, real-time adjudication, formulary-based processing

### 19. **Facets Extensions**
**Answer:**
Custom code modules that extend Facets functionality:
- **Business Rules**: Custom claim processing logic
- **Data Validation**: Additional validation routines
- **Calculations**: Custom benefit calculations
- **Integration**: External system interfaces

### 20. **Facets Database Schema**
**Answer:**
Key tables include:
- **MEME**: Member eligibility and enrollment
- **CLCL**: Claim header information
- **CLCD**: Claim detail lines
- **PRPR**: Provider information
- **BENE**: Benefit configuration

---

## Healthcare Domain Questions

### 21. **Prior Authorization**
**Answer:**
Pre-approval process for certain medical services:
- **Purpose**: Control costs and ensure medical necessity
- **Process**: Provider submits request, clinical review, approval/denial
- **Integration**: Real-time checking during claim processing

### 22. **Member Enrollment and Eligibility**
**Answer:**
- **Enrollment**: Process of adding members to health plan
- **Eligibility**: Verification of member's coverage status and benefits
- **Effective Dates**: Coverage start and end dates
- **Qualifying Events**: Life events that allow enrollment changes

### 23. **Deductible, Copay, and Coinsurance**
**Answer:**
- **Deductible**: Amount member pays before insurance coverage begins
- **Copay**: Fixed amount for specific services
- **Coinsurance**: Percentage of costs shared between member and plan

### 24. **Network vs Out-of-Network**
**Answer:**
- **In-Network**: Contracted providers, lower member costs
- **Out-of-Network**: Non-contracted providers, higher member costs
- **Balance Billing**: Provider bills member for difference

---

## EDI & Integration Questions

### 25. **EDI Transaction Types**
**Answer:**
- **837P**: Professional claims (physician services)
- **837I**: Institutional claims (hospital services)
- **835**: Electronic Remittance Advice (payment information)
- **834**: Benefit Enrollment and Maintenance
- **270/271**: Eligibility Inquiry/Response

### 26. **X12 EDI Format Structure**
**Answer:**
- **ISA**: Interchange Control Header
- **GS**: Functional Group Header
- **ST**: Transaction Set Header
- **Segments**: Data elements separated by delimiters
- **SE**: Transaction Set Trailer

### 27. **HL7 Standards**
**Answer:**
- **HL7 v2**: Messaging standard for clinical data exchange
- **HL7 v3**: Reference Information Model (RIM)
- **FHIR**: Fast Healthcare Interoperability Resources (modern API standard)

### 28. **ERA (Electronic Remittance Advice)**
**Answer:**
Electronic explanation of benefits and payment information:
- **835 Transaction**: Standard format for payment details
- **Claim-level**: Payment, adjustments, denial reasons
- **Auto-posting**: Integration with accounting systems

---

## Scenario-Based Questions

### 29. **Claim Denied Incorrectly - Investigation Steps**
**Answer:**
1. **Review claim details**: Check member eligibility, benefit coverage
2. **Validate processing rules**: Verify applied edits and business rules
3. **Check system logs**: Review processing history and error messages
4. **Test scenarios**: Recreate issue in test environment
5. **Root cause analysis**: Identify configuration or code issues
6. **Implement fix**: Update rules, reprocess claim
7. **Communicate**: Notify stakeholders and document resolution

### 30. **System Performance During Month-End**
**Answer:**
1. **Monitor system resources**: CPU, memory, disk I/O
2. **Review batch processing**: Check scheduling and dependencies
3. **Database analysis**: Identify slow queries, blocking, deadlocks
4. **Optimize queries**: Update statistics, rebuild indexes
5. **Load balancing**: Distribute processing across servers
6. **Capacity planning**: Scale resources if needed

### 31. **New Regulation Implementation**
**Answer:**
1. **Requirement analysis**: Understand regulatory changes
2. **Impact assessment**: Identify affected systems and processes
3. **Design solution**: Plan configuration and code changes
4. **Testing strategy**: Develop comprehensive test scenarios
5. **Implementation**: Deploy changes with rollback plan
6. **Validation**: Verify compliance and accuracy
7. **Training**: Update documentation and train users

---

## Wipro Specific Questions

### 32. **Why Wipro?**
**Answer:**
*"Wipro's strong presence in healthcare IT and commitment to digital transformation aligns with my career goals. The company's focus on innovation, combined with its global delivery model, provides opportunities to work on complex healthcare challenges while growing professionally. I'm particularly interested in Wipro's TriZetto practice and the chance to work with cutting-edge healthcare technologies."*

### 33. **Client Communication Approach**
**Answer:**
- **Regular updates**: Scheduled status meetings and reports
- **Clear documentation**: Requirements, design, and test documentation
- **Proactive communication**: Early escalation of issues and risks
- **Business language**: Translate technical concepts to business terms

### 34. **Agile/Scrum Experience**
**Answer:**
- **Sprint planning**: Estimation and commitment to deliverables
- **Daily standups**: Progress updates and impediment identification
- **Sprint reviews**: Demo functionality to stakeholders
- **Retrospectives**: Continuous improvement of processes

---

## Project Experience Questions

### 35. **Most Challenging Project**
**Answer Structure:**
- **Situation**: Describe the project context and challenges
- **Task**: Your specific responsibilities
- **Action**: Steps taken to address challenges
- **Result**: Outcomes and lessons learned

### 36. **Production Support Approach**
**Answer:**
1. **Immediate response**: Assess severity and impact
2. **Troubleshooting**: Review logs, replicate issues
3. **Communication**: Update stakeholders on status
4. **Resolution**: Implement fix or workaround
5. **Follow-up**: Root cause analysis and prevention

### 37. **Quality Assurance Methods**
**Answer:**
- **Code reviews**: Peer review processes
- **Unit testing**: Automated test coverage
- **Integration testing**: End-to-end scenarios
- **Performance testing**: Load and stress testing
- **Security testing**: Vulnerability assessments

---

## Preparation Tips

### Before the Interview:
1. **Review your resume**: Be ready to discuss every project and technology
2. **Research Wipro**: Company culture, recent news, healthcare focus
3. **Practice coding**: Be ready for technical coding questions
4. **Prepare examples**: Specific STAR method examples for behavioral questions
5. **Study healthcare basics**: Understand claims processing and healthcare terminology

### During the Interview:
1. **Listen carefully**: Understand the question before answering
2. **Structure your answers**: Use clear, logical explanations
3. **Ask clarifying questions**: Show engagement and critical thinking
4. **Provide examples**: Use specific experiences to support your points
5. **Show enthusiasm**: Demonstrate genuine interest in the role

### Key Technical Areas to Review:
1. **C# and .NET fundamentals**
2. **SQL Server administration and optimization**
3. **Web API development and RESTful services**
4. **Entity Framework or other ORM tools**
5. **Healthcare data standards (HL7, EDI)**
6. **System integration patterns**
7. **Performance tuning and troubleshooting**

### Healthcare Domain Focus:
1. **Claims processing workflows**
2. **Member and provider management**
3. **Healthcare compliance (HIPAA, ACA)**
4. **EDI transactions and formats**
5. **Financial processing in healthcare**

---

## Disclaimer
*This document is based on general industry knowledge and common interview patterns. Actual interview questions may vary. It's recommended to research current Wipro job postings, connect with current employees, and review Glassdoor for recent interview experiences.*

---

**Document Created**: August 6, 2025  
**Last Updated**: August 6, 2025  
**Version**: 1.0
